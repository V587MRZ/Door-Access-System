E__)

/** @brief  Clear the USART IDLE pending flag.
  * @param  __HANDLE__ specifies the USART Handle.
  *         This parameter can be USARTx where x: 1, 2, 3 or 6 to select the USART peripheral.
  * @retval None
  */
#define __HAL_USART_CLEAR_IDLEFLAG(__HANDLE__) __HAL_USART_CLEAR_PEFLAG(__HANDLE__)

/** @brief  Enables or disables the specified USART interrupts.
  * @param  __HANDLE__ specifies the USART Handle.
  *         This parameter can be USARTx where x: 1, 2, 3 or 6 to select the USART peripheral.
  * @param  __INTERRUPT__ specifies the USART interrupt source to check.
  *          This parameter can be one of the following values:
  *            @arg USART_IT_TXE:  Transmit Data Register empty interrupt
  *            @arg USART_IT_TC:   Transmission complete interrupt
  *            @arg USART_IT_RXNE: Receive Data register not empty interrupt
  *            @arg USART_IT_IDLE: Idle line detection interrupt
  *            @arg USART_IT_PE:   Parity Error interrupt
  *            @arg USART_IT_ERR:  Error interrupt(Frame error, noise error, overrun error)
  *          This parameter can be: ENABLE or DISABLE.
  * @retval None
  */
#define __HAL_USART_ENABLE_IT(__HANDLE__, __INTERRUPT__)   ((((__INTERRUPT__) >> 28U) == 1U)? ((__HANDLE__)->Instance->CR1 |= ((__INTERRUPT__) & USART_IT_MASK)): \
                                                            (((__INTERRUPT__) >> 28U) == 2U)? ((__HANDLE__)->Instance->CR2 |=  ((__INTERRUPT__) & USART_IT_MASK)): \
                                                             ((__HANDLE__)->Instance->CR3 |= ((__INTERRUPT__) & USART_IT_MASK)))
#define __HAL_USART_DISABLE_IT(__HANDLE__, __INTERRUPT__)  ((((__INTERRUPT__) >> 28U) == 1U)? ((__HANDLE__)->Instan