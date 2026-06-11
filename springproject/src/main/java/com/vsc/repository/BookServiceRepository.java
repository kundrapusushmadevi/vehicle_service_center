package com.vsc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vsc.entity.BookServiceEntity;

@Repository
public interface BookServiceRepository
        extends JpaRepository<BookServiceEntity, Integer> {

    List<BookServiceEntity> findByUserId(Integer userId);
    List<BookServiceEntity> findByUserIdOrderByIdDesc(
            Integer userId);
}