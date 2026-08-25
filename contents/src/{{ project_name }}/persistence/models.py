from sqlalchemy.orm import DeclarativeBase


# Consuming archetypes/services register their entities on this Base:
# subclass it in your own modules, and import those modules before
# ensure_schema() so the tables land on Base.metadata.
class Base(DeclarativeBase):
    pass
