package devzeus.com.ktqt_01_st2.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "author")
public class Author {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long author_id;

    private String author_name;
    private String date_of_birth;

    @ManyToMany(mappedBy = "authors")
    private Set<Book> books;
}
