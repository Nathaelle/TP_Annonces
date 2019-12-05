<?php

namespace Models;

interface Crud {

    function selectAll();
    function select(int $id);
    function insert();
    function update(int $id);
    function delete(int $id);

}