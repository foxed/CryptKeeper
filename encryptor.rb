class Encryptor
  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

  def encrypt_letter(letter, rotation)
    rotating_cipher = cipher(rotation)
    rotating_cipher[letter]
  end

  def encrypt(string, rotation)
    letters = string.split("")
    results = letters.collect do |letter|
      encrypted_letter = encrypt_letter(letter, rotation)
    end
    results.join
  end

  def decrypt(string, rotation)
    letters = string.split("")
    results = letters.collect do |letter|
      decrypted_letter = cipher(-rotation)
      decrypted_letter[letter]
    end
    results.join
  end
end
