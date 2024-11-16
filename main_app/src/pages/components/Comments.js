import React, { useState, useEffect, useRef } from "react";
import axios from "axios";
import Cookies from "js-cookie";
import {jwtDecode} from "jwt-decode";

export default function Comments({ articleId }) {
    const [comments, setComments] = useState([]);
    const [newComment, setNewComment] = useState("");
    const [replyTo, setReplyTo] = useState(null);
    const [isAdmin, setIsAdmin] = useState(false);
    const [editingCommentId, setEditingCommentId] = useState(null);
    const [editingContent, setEditingContent] = useState("");

    const replyInputRef = useRef(null);

    useEffect(() => {
        fetchComments();
        checkAdminStatus();
    }, []);

    const fetchComments = async () => {
        try {
            const response = await axios.get(`http://10.66.66.6:8081/comments/${articleId}`);
            setComments(response.data);
        } catch (error) {
            console.error("Error fetching comments:", error);
        }
    };

    const checkAdminStatus = () => {
        const token = Cookies.get("auth_token");
        if (!token) return;

        const decoded = jwtDecode(token);
        setIsAdmin(decoded.id === 1); // Проверка прав администратора
    };

    const handleAddComment = async () => {
        const token = Cookies.get("auth_token");
        if (!token) return alert("Вы должны быть авторизованы для добавления комментариев.");

        const decoded = jwtDecode(token);

        try {
            await axios.post("http://10.66.66.6:8081/comments", {
                articleId,
                userId: decoded.id,
                parentCommentId: replyTo,
                content: newComment,
            });
            setNewComment("");
            setReplyTo(null);
            fetchComments();
        } catch (error) {
            console.error("Error adding comment:", error);
        }
    };

    const handleDeleteComment = async (commentId) => {
        if (!window.confirm("Вы уверены, что хотите удалить комментарий?")) return;

        const token = Cookies.get("auth_token");
        try {
            await axios.delete(`http://10.66.66.6:8081/comments/${commentId}`, {
                headers: { Authorization: `Bearer ${token}` },
            });
            fetchComments();
        } catch (error) {
            console.error("Error deleting comment:", error);
        }
    };

    const handleEditComment = async (commentId) => {
        const token = Cookies.get("auth_token");
        try {
            await axios.put(
                `http://10.66.66.6:8081/comments/${commentId}`,
                { content: editingContent },
                {
                    headers: { Authorization: `Bearer ${token}` },
                }
            );
            setEditingCommentId(null);
            fetchComments();
        } catch (error) {
            console.error("Error editing comment:", error);
        }
    };

    const handleReply = (commentId) => {
        setReplyTo(commentId);
        setTimeout(() => {
            replyInputRef.current?.focus();
        }, 100);
    };

    const renderComments = (parentId = null, depth = 0) => {
        return comments
            .filter((comment) => comment.parent_comment_id === parentId)
            .map((comment) => (
                <div
                    key={comment.id}
                    className="mb-3"
                    style={{
                        marginTop: '10px',
                        marginLeft: `5px`,
                        borderLeft: "1px solid #ccc",
                        paddingLeft: "10px",
                    }}
                >
                    <p>
                        <strong>{comment.author}</strong> ({new Date(comment.created_at).toLocaleString()}):
                    </p>
                    {editingCommentId === comment.id ? (
                        <textarea
                            className="form-control"
                            value={editingContent}
                            onChange={(e) => setEditingContent(e.target.value)}
                        />
                    ) : (
                        <p>{comment.content}</p>
                    )}
                    {editingCommentId === comment.id ? (
                        <button
                            className="btn btn-sm btn-primary"
                            onClick={() => handleEditComment(comment.id)}
                        >
                            Сохранить
                        </button>
                    ) : (
                        <>
                            <button
                                className="btn btn-sm btn-primary"
                                onClick={() => handleReply(comment.id)}
                            >
                                Ответить
                            </button>
                            {isAdmin && (
                                <>
                                    <button
                                        className="btn btn-sm btn-danger ms-2"
                                        onClick={() => handleDeleteComment(comment.id)}
                                    >
                                        Удалить
                                    </button>
                                    <button
                                        className="btn btn-sm btn-secondary ms-2"
                                        onClick={() => {
                                            setEditingCommentId(comment.id);
                                            setEditingContent(comment.content);
                                        }}
                                    >
                                        Редактировать
                                    </button>
                                </>
                            )}
                        </>
                    )}
                    {replyTo === comment.id && (
                        <div className="mt-2">
                            <textarea
                                className="form-control"
                                rows="2"
                                placeholder="Ваш ответ..."
                                value={newComment}
                                onChange={(e) => setNewComment(e.target.value)}
                                ref={replyInputRef}
                            />
                            <button
                                className="btn btn-primary btn-sm mt-2"
                                onClick={handleAddComment}
                                disabled={!newComment.trim()}
                            >
                                Отправить
                            </button>
                            <button
                                className="btn btn-secondary btn-sm mt-2 ms-2"
                                onClick={() => setReplyTo(null)}
                            >
                                Отмена
                            </button>
                        </div>
                    )}
                    {renderComments(comment.id, depth + 1)}
                </div>
            ));
    };

    return (
        <div className="mt-5">
            <h3>Комментарии</h3>
            {/* Поле для добавления нового комментария */}
            <div className="mt-4 mb-4">
                <textarea
                    className="form-control"
                    rows="3"
                    placeholder="Добавить комментарий..."
                    value={newComment}
                    onChange={(e) => setNewComment(e.target.value)}
                />
                <button
                    className="btn btn-primary mt-2"
                    onClick={handleAddComment}
                    disabled={!newComment.trim()}
                >
                    Отправить
                </button>
                {replyTo && (
                    <button
                        className="btn btn-secondary mt-2 ms-2"
                        onClick={() => setReplyTo(null)}
                    >
                        Отменить ответ
                    </button>
                )}
            </div>

            {renderComments()}
        </div>
    );
}