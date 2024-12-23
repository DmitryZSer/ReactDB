import axios from "axios";

const BASE_URL = "http://localhost:8081"; // URL сервера

// Получить статью по ID
export const getArticleById = async (id) => {
    try {
        const response = await axios.get(`${BASE_URL}/articles/${id}`);
        return response.data;
    } 
    catch (error) {
        throw error;
    }
};

// Редактировать статью по ID
export const putArticleById = async (id, data) => {
    try {
        await axios.put(`${BASE_URL}/articles/${id}`, data);
    } 
    catch (error) {
        throw error;
    }
};

// Удалить статью по ID
export const deleteArticleById = async (id) => {
    try {
        await axios.delete(`${BASE_URL}/articles/${id}`);
    } 
    catch (error) {
        throw error;
    }
};

// Создать статью
export const postArticle = async (data) => {
    try {
        await axios.post(`${BASE_URL}/articles`, data);
    }
    catch (error) {
        throw error;
    }
}

// Получить все статьи
export const getArticlesParameters = async (data) => {
    try {
        const response = await axios.get(`${BASE_URL}/articles`, data)
        return response.data;
    }
    catch (error) {
        throw error;
    }
}

// Получить список всех статей
export const getTagsWithArticles = async () => {
    try { 
        const response = await axios.get(`${BASE_URL}/tags-with-articles`);
        return response.data;
    }
    catch (error) {
        throw error;
    }
}

// Получить комментарии для статьи
export const getCommentsByArticleId = async (articleId) => {
    try {
        const response = await axios.get(`${BASE_URL}/comments/${articleId}`);
        return response;
    } 
    catch (error) {
        throw error;
    }
};

// Добавить комментарий
export const postComment = async (data) => {
    try {
        const response = await axios.post(`${BASE_URL}/comments`, data);
        return response.data;
    } 
    catch (error) {
        throw error;
    }
};

// Удалить комментарий
export const deleteCommentById = async (commentId) => {
    try {
        await axios.delete(`${BASE_URL}/comments/${commentId}`);
    } 
    catch (error) {
        throw error;
    }
};

// Обновить комментарий
export const putCommentById = async (commentId, data) => {
    try {
        const response = await axios.put(`${BASE_URL}/comments/${commentId}`, data,);
        return response.data;
    } 
    catch (error) {
        throw error;
    }
};

    // Изменение пароля
export const postChangePassword = async (newPassword, token) => {
    try { 
        await axios.post(`${BASE_URL}/change-password`, { newPassword }, {
            headers: { Authorization: `Bearer ${token}` }
       });
    }
    catch (error) {
        throw error;
    }
}


