        package com.dkt.cgshoppii.service;

        import com.dkt.cgshoppii.model.entity.User;

        import java.util.List;
        import java.util.Optional;

        public interface IUserService {
            List<User> findAllUsers();
            Optional<User> findUserByUsername(String username);
            void registerUser(User user);
        }
