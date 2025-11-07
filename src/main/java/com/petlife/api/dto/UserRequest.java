package com.petlife.api.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record UserRequest(
        @NotBlank String nome,
        @NotBlank @Email String email,
        @NotNull Boolean ativo) {
}
