import axios from "axios";
import { useContext } from "react";
import { KeycloakContext} from "../auth/KeycloakContext";

const BASE_URL = "http://localhost:8081";

export const useApi = () => {
    const { keycloak, user_roles } = useContext(KeycloakContext);

    // Проверка ролей пользователя
    const hasRole = (requiredRoles) => {
        if (!user_roles || !Array.isArray(user_roles)) return false;
        return requiredRoles.some(role => user_roles.includes(role));
    };

    // Создаем экземпляр Axios
    const api = axios.create({
        baseURL: BASE_URL,
    });

    // Интерцептор для добавления токена к запросам
    api.interceptors.request.use(
        async (config) => {
            // Добавляем токен к заголовкам
            if (keycloak?.token) {
                config.headers.Authorization = `Bearer ${keycloak.token}`;
            }
            return config;
        },
        (error) => Promise.reject(error)
    );

    // Функции API с проверкой прав
    return {
        // Публичные методы (не требуют авторизации)
        getArticleById: async (id) => {
            const response = await axios.get(`${BASE_URL}/articles/${id}`);
            return response.data;
        },

        getArticlesParameters: async (params) => {
            const response = await axios.get(`${BASE_URL}/articles`, params);
            return response.data;
        },

        getTagsWithArticles: async () => {
            const response = await axios.get(`${BASE_URL}/tags-with-articles`);
            return response.data;
        },

        getAllTags: async () => {
            const response = await axios.get("http://localhost:8081/tags");
            return response.data;
        },

        getCommentsByArticleId: async (articleId) => {
            const response = await axios.get(`${BASE_URL}/comments/${articleId}`);
            return response.data;
        },

        // Защищенные методы
        putArticleById: async (id, data) => {
            if (!hasRole(['Administrators', 'SEO'])) {
                throw new Error("Forbidden: Insufficient permissions");
            }
            await api.put(`/articles/${id}`, data);
        },

        deleteArticleById: async (id) => {
            if (!hasRole(['Administrators', 'SEO'])) {
                throw new Error("Forbidden: Insufficient permissions");
            }
            await api.delete(`/articles/${id}`);
        },

        postArticle: async (data) => {
            if (!hasRole(['Creators', 'Administrators', 'SEO'])) {
                throw new Error("Forbidden: Insufficient permissions");
            }
            await api.post("/articles", data);
        },

        postComment: async (data) => {
            if (!keycloak.authenticated) {
                throw new Error("Unauthorized");
            }
            const response = await api.post("/comments", data);
            return response.data;
        },

        putCommentById: async (commentId, data) => {
            if (!hasRole(['Moderators', 'Administrators', 'SEO'])) {
                throw new Error("Forbidden: Insufficient permissions");
            }
            const response = await api.put(`/comments/${commentId}`, data);
            return response.data;
        },

        deleteCommentById: async (commentId) => {
            if (!hasRole(['Moderators', 'Administrators', 'SEO'])) {
                throw new Error("Forbidden: Insufficient permissions");
            }
            await api.delete(`/comments/${commentId}`);
        }
    };
};