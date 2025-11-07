package com.petlife.api.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record UserRequest(
        @NotBlank @Email String email,
        @NotBlank String senha,
        @NotNull Boolean ativo) {
}
