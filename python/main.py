import re

def validate_password(password, username, previous_passwords):
    # Check length
    if len(password) < 10:
        return "Password must be at least 10 characters long."

    # Check for character variety
    if not re.search(r'[A-Z]', password) or not re.search(r'[a-z]', password) or not re.search(r'[0-9]', password) or not re.search(r'[!@#$%&\*()]', password):
        return "Password must contain at least two uppercase letters, two lowercase letters, two digits, and two special characters."

    # Check for sequences from the username
    if re.search(f'([{username}])([{username}])*', password):
        return f"Password cannot contain sequences of three or more consecutive characters from the username '{username}'."

    # Check for repetition
    if re.search(r'(.)\1\1\1', password):
        return "Password cannot contain any character that repeats more than three times in a row."

    # Check against previous passwords
    if password in previous_passwords:
        return f"Password cannot be the same as one of the last three passwords."
    previous_passwords.append(password)
    if len(previous_passwords) > 3:
        previous_passwords.pop(0)

    # If all checks pass, return True
    return True

# Example usage:
username = "user123"
previous_passwords = []

password = input("Enter a new password: ")
while not validate_password(password, username, previous_passwords):
    print(validate_password(password, username, previous_passwords))
    password = input("Enter a new password: ")