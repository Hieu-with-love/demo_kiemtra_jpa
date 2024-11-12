package devzeus.com.ktqt_01_st2.service;

import devzeus.com.ktqt_01_st2.model.Author;

import java.util.List;

public interface AuthorService {
    Author createAuthor(Author author);
    Author updateAuthor(Author author);
    void deleteAuthor(Long authorId);
    Author findAuthorById(Long authorId);
    List<Author> findAllAuthors();
}
