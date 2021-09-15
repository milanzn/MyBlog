package cubes.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import cubes.main.entity.Role;

public interface RoleRepository extends JpaRepository<Role, String>{

}
