<template>
  <div class="m-4">
    <div
      class="modal fade"
      id="crear_conductor"
      tabindex="-1"
      aria-labelledby="crear_conductorLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <form @submit.prevent="guardarConductor" class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="crear_conductorLabel">
              {{ titulo }} Conductor
            </h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-12 mb-3">
                <label class="required form-label"
                  ><b>Identificación:</b></label
                >
                <input
                  class="form-control"
                  v-model="formData.identificacion"
                  type="text"
                  required
                />
              </div>
              <div class="col-12 mb-3">
                <label class="required form-label"><b>Nombre:</b></label>
                <input
                  class="form-control"
                  v-model="formData.nombre"
                  type="text"
                  required
                />
              </div>
              <div class="col-12 mb-3">
                <label class="required form-label"><b>Apellido:</b></label>
                <input
                  class="form-control"
                  v-model="formData.apellido"
                  type="text"
                  required
                />
              </div>
              <div class="col-12 mb-3">
                <label class="required form-label"><b>Telefono:</b></label>
                <input
                  class="form-control"
                  v-model="formData.telefono"
                  type="number"
                  required
                />
              </div>
              <div class="col-12 mb-3">
                <label class="required form-label"><b>Dirección:</b></label>
                <input
                  class="form-control"
                  v-model="formData.direccion"
                  type="text"
                  required
                />
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Cerrar
            </button>
            <button type="submit" class="btn btn-primary">Guardar</button>
          </div>
        </form>
      </div>
    </div>
    <div
      class="modal fade"
      id="vehiculos"
      tabindex="-1"
      aria-labelledby="vehiculosLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="vehiculosLabel">Vehiculos</h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <table class="table">
              <thead class="table-dark">
                <tr>
                  <th>Placa</th>
                  <th>Modelo</th>
                  <th>Capacidad</th>
                  <th>Opciones</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(vehiculo, index) in vehiculos_asociados"
                  v-bind:key="index"
                  :id="index"
                >
                  <td>
                    {{ vehiculo.placa }}
                  </td>
                  <td>
                    {{ vehiculo.modelo }}
                  </td>
                  <td>
                    {{ vehiculo.capacidad }}
                  </td>
                  <td>
                    <button
                      type="button"
                      class="btn btn-danger"
                      @click="asociarVehiculo(vehiculo.id_vehiculo, null)"
                    >
                      Desasociar
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Cerrar
            </button>
          </div>
        </div>
      </div>
    </div>
    <div class="card shadow">
      <div class="row">
        <ul class="nav flex-column nav nav-pills p-4 col-lg-3">
          <li class="nav-item mb-2">
            <a class="nav-link active" aria-current="page" href="#conductores"
              >Conductores</a
            >
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Vehiculos</a>
          </li>
        </ul>
        <div class="tab-content p-4 col-lg-9">
          <div
            class="tab-pane fade show active"
            id="conductores"
            role="tabpanel"
            aria-labelledby="home-tab"
            tabindex="0"
          >
            <h1>Conductores</h1>
            <button
              type="button"
              class="btn btn-info my-2"
              data-bs-toggle="modal"
              data-bs-target="#crear_conductor"
              @click="
                titulo = 'Crear';
                limpiarConductor();
              "
            >
              Crear
            </button>
            <table class="table">
              <thead class="table-dark">
                <tr>
                  <th>Identificación</th>
                  <th>Nombre</th>
                  <th>Apellido</th>
                  <th>Telefono</th>
                  <th>Direccion</th>
                  <th>Opciones</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(conductor, index) in conductores"
                  v-bind:key="index"
                  :id="index"
                >
                  <td>
                    {{ conductor.identificacion }}
                  </td>
                  <td>
                    {{ conductor.nombre }}
                  </td>
                  <td>
                    {{ conductor.apellido }}
                  </td>
                  <td>
                    {{ conductor.telefono }}
                  </td>
                  <td>
                    {{ conductor.direccion }}
                  </td>
                  <td>
                    <button
                      type="button"
                      class="btn btn-success"
                      data-bs-toggle="modal"
                      data-bs-target="#vehiculos"
                      @click="getVehiculosAsociados(conductor.id_conductor)"
                    >
                      Vehiculos
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Swal from "sweetalert2";
export default {
  data() {
    return {
      formData: {
        identificacion: null,
        nombre: null,
        apellido: null,
        telefono: null,
        direccion: null,
      },
      conductores: [],
      titulo: null,
      vehiculos_asociados: [],
      conductor_seleccionado: null,
    };
  },
  mounted() {
    this.getConductores();
  },
  methods: {
    getConductores() {
      axios
        .get("http://127.0.0.1:8000/SC/conductores")
        .then((response) => {
          this.conductores = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    limpiarConductor() {
      this.formData.identificacion = null;
      this.formData.nombre = null;
      this.formData.apellido = null;
      this.formData.telefono = null;
      this.formData.direccion = null;
    },
    guardarConductor() {
      axios
        .post("http://127.0.0.1:8000/SC/guardarConductor", {
          formData: JSON.stringify(this.formData),
        })
        .then((response) => {
          Swal.fire(
            "Conductor Guardado",
            "El conductor ha sido guardado correctamente.",
            "success"
          ).then((result) => {
            this.getConductores();
            this.limpiarConductor();
          });
        })
        .catch((error) => {
          Swal.fire("Error", "No se pudo guardar la información", "error");
          console.log(error);
        });
    },
    getVehiculosAsociados(id_conductor) {
      this.conductor_seleccionado = id_conductor;
      this.vehiculos_asociados = [];
      axios
        .get(
          "http://127.0.0.1:8000/SC/vehiculosAsociados/" +
            this.conductor_seleccionado
        )
        .then((response) => {
          this.vehiculos_asociados = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    asociarVehiculo(id_vehiculo, id_conductor) {
      axios
        .post("http://127.0.0.1:8000/SC/asociarConductor", {
          id_vehiculo: id_vehiculo,
          id_conductor: id_conductor,
        })
        .then((response) => {
          var accion;
          if (id_conductor == null) {
            accion = "desasociado";
          } else {
            accion = "desasociado";
          }
          Swal.fire(
            "Exito",
            "El vehiculo ha sido " + accion + " correctamente.",
            "success"
          ).then((result) => {
            this.getVehiculosAsociados(this.conductor_seleccionado);
            //this.limpiarVehiculo();
          });
        })
        .catch((error) => {
          Swal.fire("Error", "No se pudo guardar la información", "error");
          console.log(error);
        });
    },
  },
};
</script>
<style>
.required:after {
  content: " *";
  color: red;
}
</style>
