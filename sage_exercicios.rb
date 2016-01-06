class SageExcericiosController < ApplicationController

  #Write a function accepting two floating-point numbers and returns its multiplication, taking into account the following rules:
  def exercicio_1(valor1, valor2)
    @tentativa = session[:tentativa] || 0
    if @tentativa == 0
      @tentativa = 1
    else
      @tentativa += 1
    end
    session[:tentativa] = @tentativa

    #Provided parameters must be floating-point numbers;
    if !is_number(valor1) || !is_number(valor2)
      puts 'O valor passado não é um ponto flutuante'
      return 'O valor passado não é um ponto flutuante'
    end

    valor1 = Float(valor1)
    valor2 = Float(valor2)

    #Each provided number must be in between 1500.0 and 6700.0;
    if !(1500..6700).include?(valor1) || !(1500..6700).include?(valor2)
      puts 'A valor deve estar entre 1500 e 6700'
      return 'A valor deve estar entre 1500 e 6700'
    end
    resultado = valor1*valor2
    #Your answer should contain a number of test examples and the output.
    puts "Tentativa número: "+@tentativa.to_s
    #The answer should display 5 decimal digits;
    puts "O resuultado é: "+sprintf('%.5f',resultado).to_s
    return "O resultado é "+sprintf('%.5f',resultado).to_s
  end

  #Write a function accepting two string parameters returning true if the first parameter is a substring of the second.
  def exercicio_2(palavra1, palavra2)

    # Check that both Parameters have been provided;
    if palavra1.blank? || palavra2.blank?
      puts 'Voce nao preencheu as duas palavras'
      return 'Voce nao preencheu as duas palavras'
    end

    # Check that both Parameters are Strings;
    if is_number(palavra1) || is_number(palavra2)
      puts 'Ambas as palavras devem ser Strings'
      return 'Ambas as palavras devem ser Strings'
    end

    # Check that the length of the second Parameter is greater than or equal to the length of the first;
    if palavra2.length < palavra1.length
      puts "O tamanho da segunda palavra é menor que a primeira"
      return "O tamanho da segunda palavra é menor que a primeira"
    end

    return palavra2.include?(palavra1)

  end

  #Create a copy of that function and change that copy in order to make it case insensitive.
  def exercicio_2_sensitive(palavra1, palavra2)

    # Check that both Parameters have been provided;
    if palavra1.blank? || palavra2.blank?
      puts 'Voce nao preencheu as duas palavras'
      return 'Voce nao preencheu as duas palavras'
    end

    # Check that both Parameters are Strings;
    if is_number(palavra1) || is_number(palavra2)
      puts 'Ambas as palavras devem ser Strings'
      return 'Ambas as palavras devem ser Strings'
    end

    # Check that the length of the second Parameter is greater than or equal to the length of the first;
    if palavra2.length < palavra1.length
      puts "O tamanho da segunda palavra é menor que a primeira"
      return "O tamanho da segunda palavra é menor que a primeira"
    end


    return palavra2.downcase.include?(palavra1.downcase)

  end

  def is_number(valor)
    return valor.match(/\A[+-]?\d+?(\.\d+)?\Z/) != nil
  end

  def exercicio_3(valor)

    #Write a function that receives a number as a parameter.
    #The function should return true if that number is a power of 2, and false otherwise.
    if !is_number(valor)
      puts 'O valor informado não é um número'
      return 'O valor informado não é um número'
    end
    valor_teste = Float(valor)

    #Verifica se é par
    if (valor_teste % 2 != 0)
      return false
    end

    while(valor_teste != 2)
      valor_teste = valor_teste/2
      puts valor_teste
      if !(valor_teste % 2 == 0)
        return false
      end
    end

    return true

  end

end
