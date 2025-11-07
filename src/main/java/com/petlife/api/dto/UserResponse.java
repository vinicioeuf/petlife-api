package com.petlife.api.dto;

public record UserResponse(Long id, String nome, String email, Boolean ativo) {
}
