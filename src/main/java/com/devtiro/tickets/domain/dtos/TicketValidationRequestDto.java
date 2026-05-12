package com.devtiro.tickets.domain.dtos;

import com.devtiro.tickets.domain.entities.TicketValidationMethod;
import jakarta.validation.constraints.NotNull;
import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TicketValidationRequestDto {
  @NotNull(message = "Ticket or QR code ID must be provided")
  private UUID id;

  @NotNull(message = "Validation method must be provided")
  private TicketValidationMethod method;
}
